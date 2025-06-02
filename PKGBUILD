pkgname=uutils-coreutils-missing
pkgver=0.1.0
pkgrel=2
pkgdesc='Missing files from uutils-coreutils by bug'
arch=('x86_64')
license=('MIT')
url='https://github.com/uutils/coreutils/issues/4464'
depends=( uutils-coreutils )
options=(zipman) # for symlinks
package() {
  install -d "${pkgdir}"/usr/{bin,share/man/man1}
  for b in {b2,b3,md5,sha1,sha224,sha256,sha3-224,sha3-256,sha3-384,sha3-512,sha384,sha3,sha512,shake128,shake256}sum;do
    uu-ln -sf /usr/bin/uu-coreutils "${pkgdir}"/usr/bin/uu-$b
    uu-coreutils manpage $b > "${pkgdir}"/usr/share/man/man1/uu-$b.1
  done
}
