# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

pkgname=ctmg
pkgver=1.2
pkgrel=3
pkgdesc="Simple wrapper around cryptsetup for encrypted containers"
arch=('any')
url="https://git.zx2c4.com/ctmg/"
license=('ISC')
depends=('cryptsetup' 'e2fsprogs' 'coreutils')
source=("https://git.zx2c4.com/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz"
        "ctmg.1")
md5sums=('ed4c016d905137eb28fe79217df7de04'
         'bdded0046afd35ba47cba9185b81f9a3')

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr" install

  # Doc files
  install -Dm644 README.md \
    "{$pkgdir}/usr/share/doc/${pkgname}/README"

  # Man files
  install -Dm644 ../ctmg.1 \
    "${pkgdir}/usr/share/man/man1/ctmg.1"

  # License
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 cc=80 et:
