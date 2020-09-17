# Maintainer: Tyler <tyler@cyb3r.space>

pkgname=open-numismat-bin
pkgver=1.8.7
pkgrel=1
pkgdesc='Coin collecting software to organize and manage your own coin catalogue.'
arch=('any')
url="http://opennumismat.github.io"
license=('GPL3')
groups=('')
depends=('bash-completion' 'hicolor-icon-theme' 'pyside2' 'python' 'python-dateutil' 'python-jinja' 'python-django' 'python-lxml' 'python-matplotlib' 'python-numpy' 'python-xlrd' 'qt5-base')
options=('!strip' '!emptydirs')
install=open-numismat-bin.install
source=("https://github.com/OpenNumismat/open-numismat/releases/download/${pkgver}/open-numismat_${pkgver}_all.deb")
sha512sums=('d0d8bc0120b00418adbd6737c31ef59e02435b9430d8ca3b805caf19c73c6628be7d1a326b0a80f2a55795a9f2587c1eebce63c69c5c25636a1f0e5541b167a4')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
    # python3 directory needs to point to correct python-current version, wierd debian python packaging formats
    LATEST_PYTHON=$(ls -l /usr/bin/python3 | cut -d ">" -f 2 |  tr -d '[:space:]')
    mv "${pkgdir}/usr/lib/python3/" "${pkgdir}/usr/lib/$LATEST_PYTHON/" 
    mv "${pkgdir}/usr/lib/$LATEST_PYTHON/dist-packages" "${pkgdir}/usr/lib/$LATEST_PYTHON/site-packages" 
}
