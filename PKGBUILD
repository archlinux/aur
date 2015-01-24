# Mainteiner: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
#Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>
#Contributor: hyness <hyness@gmail.com>

pkgname=xfce4-remmina-plugin
pkgver=0.8.1
pkgrel=2
pkgdesc="Xfce panel applet for remmina."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/remmina/"
license=('GPL')
source=("http://downloads.sourceforge.net/project/remmina/0.8/remmina-xfce-$pkgver.tar.gz")
depends=('remmina' 'xfce4-panel')
options=(!libtool)
md5sums=('7b95ed26f6518d26166904ef63d1b936')

build() {
  cd remmina-xfce-$pkgver
  ./configure --prefix=/usr --enable-nls --enable-avahi 
  make 
  }
package() {  
  cd remmina-xfce-$pkgver  
  make DESTDIR=$pkgdir install
}

