# Maintainer: Antonio Arias Orzanco <antonio dot arias99999 at gmail dot com>

pkgname=scrivano
pkgver=0.21.5
pkgrel=1
pkgdesc="Notetaking application aimed at those who prefer handwriting over typing."
arch=('x86_64')
url="https://github.com/scrivanolabs/ScrivanoForLinux"
#url="https://scrivanolabs.github.io/"
license=('CC-BY-NC-ND-4.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/scrivanolabs/ScrivanoForLinux/releases/download/${pkgver}/Scrivano_${pkgver}.tar.gz"
         scrivano.svg::https://raw.githubusercontent.com/scrivanolabs/scrivanolabs.github.io/master/icon.svg
         scrivano.desktop)
md5sums=('909bb4bc8ba5bfdfed135c3da5f303aa'
         '4a39e18509d8cc877d4934c39ec14d5d'
         '4ca6be9398d9c8339d3d51a5e4bbf152')

package() {
   # Desktop icon
   install -Dm644 scrivano.svg $pkgdir/usr/share/pixmaps/scrivano.svg
   install -Dm644 scrivano.desktop $pkgdir/usr/share/applications/scrivano.desktop

   # Application files
   cd "Scrivano_${pkgver}"
   mkdir -p $pkgdir/opt/scrivano
   cp -rf * $pkgdir/opt/scrivano
}
