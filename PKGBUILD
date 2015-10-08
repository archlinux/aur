pkgbase=aibizhi
pkgname=aibizhi
pkgver=20151008
pkgrel=1
pkgdesc="爱壁纸"
arch=('any')
license=('GPLv3')
url='https://github.com/zhuzilinuser/aibizhi'
depends=('python2-pyside' 'python2-shiboken' 'shiboken' 'python-pyside-common')
makedepends=('git')
source=("${pkgname}"::'git+https://github.com/zhuzilinuser/aibizhi.git')
md5sums=('SKIP')
conflicts=("aibizhi")

pkgver(){
   cd  "$srcdir/$pkgname/"
   git log -1 --format="%cd" --date=short | sed 's|-||g'
   msg "终于搞定了。。。"
}
package(){
cd  "$srcdir/$pkgname/"
mkdir -p "$pkgdir/usr/share/pyshared/"
mkdir -p "$pkgdir/usr/share/icons/"
mkdir -p "$pkgdir/usr/share/applications/"
mkdir -p "$pkgdir/usr/bin/"
cp -r "lovewallpaper" "$pkgdir/usr/share/pyshared/"
cp "data/love-wallpaper.png" "$pkgdir/usr/share/icons/"
cp "data/love-wallpaper.desktop" "$pkgdir/usr/share/applications/"
cp "love-wallpaper" "$pkgdir/usr/bin/"
}
