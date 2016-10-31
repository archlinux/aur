# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git

pkgname=duckietv
pkgver=1.1.3
pkgrel=1
pkgdesc="DuckieTV is an application that takes care of TV-Show addicts by providing a personalized TV-Show calendar."
url="https://schizoduckie.github.io/DuckieTV/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('nodejs')
source=('https://github.com/SchizoDuckie/DuckieTV/releases/download/1.1.3/DuckieTV-1.1.3-Linux-x64.tar.gz'
		'DuckieTV.desktop'
		'icon.png')
md5sums=('bc78ee5ae68f78021b47d95067404c28' 
		'8461f133a0a6e3ae38eea835bfafbb0b'
		'591fcd7c2c1ceadf33935ed9da0091af')

package() {
	install -d ${pkgdir}/opt
	mkdir -p "${pkgdir}"/usr/share/applications
	mkdir -p "${pkgdir}"/usr/share/menu
	cp -v "${srcdir}"/DuckieTV.desktop "${pkgdir}"/usr/share/applications/DuckieTV.desktop
	cp -v "${srcdir}"/DuckieTV-1.1.3-Linux-x64/share/menu/PKGNAME "${pkgdir}"/usr/share/menu/DuckieTV
	
	cp -rv "${srcdir}"/DuckieTV-1.1.3-Linux-x64/DuckieTV "${pkgdir}"/opt
    mkdir -p "${pkgdir}"/usr/bin/
    ln -s "${pkgdir}"/opt/DuckieTV/DuckieTV "${pkgdir}"/usr/bin/DuckieTV

    mkdir "${pkgdir}"/opt/DuckieTV/lib
    ln -sf "/usr/lib/libudev.so.1" "${pkgdir}"/opt/DuckieTV/lib/libudev.so.0
    cp -v "${srcdir}"/icon.png "${pkgdir}"/opt/DuckieTV/icon.png
    
    

}


