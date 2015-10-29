# Maintainer: Christoph Drexler <chrdr@gmx.at>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Bjoern Bidar <theodorstormgrade@gmail.com>

pkgname=firefox-extension-kwallet-kf5
pkgver=1.0
pkgrel=1
pkgdesc="An extension that allows Firefox to use KF5's Kwallet to store passwords"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=173994"
license=('LGPL')
depends=('firefox' 'kwalletmanager')
source=('http://www.guillermomolina.com.ar/en/files/category/3-firefox-kde5-wallet?download=32:firefox-kde5-kwallet-extendion-version-1-0')
sha256sums=('3b6ae1e1b42f4d028691be4fb7cc0278187b0d9a38d096593c298915f36dc334')

package() {
  # Variables
  emid=$(grep -Pom1 'id>\K[^<]*' install.rdf)
  dstdir=$pkgdir/usr/lib/firefox/browser/extensions/$emid

  # Install
  install -dm755 "$dstdir"
  cp -r * "$dstdir/"
}
