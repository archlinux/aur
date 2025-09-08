# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.6.17
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://codeberg.org/Mintsuki/jinx"
license=("BSD")
depends=('sh' 'awk' 'curl' 'debootstrap' 'findutils' 'gcc' 'git' 'grep' 'gzip' 'make' 'pkgconf' 'procps' 'tar' 'util-linux' 'libarchive' 'openssl' 'zlib')
source=("git+https://codeberg.org/Mintsuki/jinx.git#tag=v${pkgver}?signed")
b2sums=('849495b2d6d2a10aa705ca40726e40006da6f951dee01e94e16a0c2b7c9fee13a46d9db3682c8d3434e55324b6fcde1ebd10aa2672ec9511bd7bdacd592c3822')
validpgpkeys=('05D29860D0A0668AAEFB9D691F3C021BECA23821') # Mintsuki <mintsuki@protonmail.com>

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
