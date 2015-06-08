# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=encuentro-bzr
pkgver=3.1+r260
pkgrel=1
pkgdesc="Busque, descargue, y vea el maravilloso contenido ofrecido por el Canal Encuentro, Paka Paka, Educ.ar y otros."
url="http://encuentro.taniquetil.com.ar"
arch=('any')
depends=('python2' 'python2-pyqt4' 'python2-defer' 'python2-requests' 'python2-beautifulsoup4' 'python2-notify' 'python2-xdg')
makedepends=('python2-distribute')
license=('GPL v3')
# conflicts=('')
# provides=('')
source=("$pkgname"::'bzr+http://bazaar.launchpad.net/~facundo/encuentro/trunk/')
md5sums=('SKIP')

#_bzrtrunk=lp:encuentro
#_bzrmod=encuentro

pkgver() {

	cd $pkgname
    
	# bzr revno
    	printf "3.1+r%s" "$(bzr revno)"
    
}

build() {
  
    	cd "$srcdir/$pkgname"
    
    	msg2 "  -> Build program ..."
    	python2 setup.py build
    
}

package() {
   
    	cd "$srcdir/$pkgname"

    	msg2 "  -> Installing program, icons and .desktop file ..."
    	python2 setup.py install --root=$pkgdir --optimize=1

}

# vim:set ts=2 sw=2 et: