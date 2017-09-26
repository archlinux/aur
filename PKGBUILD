# Maintainer: Tim Woosley <woosleyt@gmail.com>
# Contributor: Robert Hamilton <rghamilton3@gmail.com>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

pkgname=duckietv
pkgver=1.1.5
pkgrel=1
pkgdesc="DuckieTV is an application that takes care of TV-Show addicts by providing a personalized TV-Show calendar."
url="https://schizoduckie.github.io/DuckieTV/"
arch=('x86_64')
license=('MIT')
depends=('nodejs' 'gconf')
source=('https://github.com/SchizoDuckie/DuckieTV/releases/download/1.1.5/DuckieTV-1.1.5-linux-x64.tar.gz')
md5sums=('9478acf9147a036fafefa860d15aef89')

package() {
    
    install -d "$pkgdir"/opt
	
    #Main Program
    mkdir -p "${pkgdir}"/opt
	cp -r "$srcdir"/DuckieTV "$pkgdir"/opt
    #Shortcut
    mkdir -p "${pkgdir}"/usr/share/applications
    cp "$srcdir"/share/applications/DuckieTV.desktop "$pkgdir"/usr/share/applications
    #Shortcut Link
    mkdir -p "${pkgdir}"/usr/bin/
    ln -s /opt/DuckieTV/DuckieTV "$pkgdir"/usr/bin/DuckieTV
	#pixmap
    mkdir -p "${pkgdir}"/usr/share/pixmaps
    cp "$srcdir"/share/pixmaps/DuckieTV.xpm "$pkgdir"/usr/share/pixmaps
}
