# Maintainer: Daniel Boerlage <daniel.brlg@gmail.com>
pkgname=netica
pkgver=6.07
pkgrel=1
pkgdesc="Probabilistic graphical model software for editing, learning from data, and computation with Bayesian networks"
arch=('any')
url="https://norsys.com/"
license=('custom:netica license')
depends=('wine-mono')
install=${pkgname}.install
source=(netica https://www.norsys.com/downloads/old_versions/Netica_Win_607.zip)
sha256sums=('31c60a2af0520a121161b66d4a1fa0e7c055766130bf63682aab06fb8c6a50dd'
            '00e56212fb488237d5253ff80de0c125175e0d219b4a37b989f0fcc1986d1951')

package() {
	# install netica-app
	install -d "$pkgdir"/opt/norsys/netica/
	cp -a "Netica 607"/* "$pkgdir"/opt/norsys/netica/

	# installing netica launcher
	install -d "$pkgdir"/usr/bin/
	install -m755 netica "$pkgdir"/usr/bin/netica

	# linking licence
	install -d "$pkgdir"/usr/share/licenses/netica
	ln -s '/opt/norsys/netica/License Agreement.pdf' "$pkgdir"/usr/share/licenses/netica/LICENSE.pdf
}
