# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Joris Steyn <jorissteyn@gmail.com>
# Please report issues at https://github.com/sanduhrs/arch-aur-phploc

pkgname=phploc
pkgver=7.0.2
pkgrel=1
pkgdesc="A tool for quickly measuring the size of a PHP project"
url="https://github.com/sebastianbergmann/phploc"
arch=("any")
license=("BSD")
depends=("php")
source=("https://phar.phpunit.de/${pkgname}-${pkgver}.phar"
        "https://raw.githubusercontent.com/sebastianbergmann/${pkgname}/${pkgver}/LICENSE")
sha512sums=('c83abb4ef7b5ab1a0757879498c7171fc86cc0202af64aa3b664fc2547b02f27d81f69498193c724445a046fa41a4e266d8f9bb3cc21d5c4152f14d23b57319c'
            '01b3d9272d9677c3f3a90d8eeb1409909d6ea48d87430c98a78b2ddd2f1949888a9de80bc210fcc98420d0dcfa11ca1a0bd0a8fc03def4639703061ea583c1be')

package() {
  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/share/webapps/bin/${pkgname}.phar"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/webapps/bin/${pkgname}.phar" "${pkgdir}/usr/bin/${pkgname}"
}
