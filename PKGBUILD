# Maintainer: Tim Woosley <woosleyt@gmail.com>
# Contributor: Rober Hamilton <rghamilton3@gmail.com>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

pkgname=duckietv
pkgver=1.1.4
pkgrel=2
pkgdesc="DuckieTV is an application that takes care of TV-Show addicts by providing a personalized TV-Show calendar."
url="https://schizoduckie.github.io/DuckieTV/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('nodejs')
source=('https://github.com/SchizoDuckie/DuckieTV/releases/download/1.1.4/DuckieTV-1.1.4-Linux-x64.tar.gz')
md5sums=('b837a9a782ace35077e7688d0eab1dbc')

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
    ln -s "${pkgdir}"/opt/DuckieTV/DuckieTV "${pkgdir}"/usr/bin/DuckieTV
	#pixmap
    mkdir -p "${pkgdir}"/usr/share/pixmaps
    cp "$srcdir"/share/pixmaps/DuckieTV.xpm "$pkgdir"/usr/share/pixmaps
}