# Maintainer: Daniel Boerlage <daniel.brlg@gmail.com>
pkgname=netica
pkgver=6.05
pkgrel=1
pkgdesc="Probabilistic graphical model software for editing, learning from data, and computation with Bayesian networks"
arch=('any')
url="norsys.com"
license=('custom:netica license')
depends=('wine-mono')
install=${pkgname}.install
source=(netica https://www.norsys.com/downloads/Netica_Win.zip)
sha256sums=('31c60a2af0520a121161b66d4a1fa0e7c055766130bf63682aab06fb8c6a50dd'
            '80996571ad49e35ef9390fd05044839c4426789848fda192656028448263d75a')

package() {
	# install netica-app
	install -d "$pkgdir"/opt/norsys/netica/
	cp -a "Netica 605"/* "$pkgdir"/opt/norsys/netica/

	# installing netica launcher
	install -d "$pkgdir"/usr/bin/
	install -m755 netica "$pkgdir"/usr/bin/netica

	# linking licence
	install -d "$pkgdir"/usr/share/licenses/netica
	ln -s '/opt/norsys/netica/License Agreement.pdf' "$pkgdir"/usr/share/licenses/netica/LICENSE.pdf
}
