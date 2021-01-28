pkgname=pymodoro
pkgver=1
pkgrel=1
pkgdesc="A very smol pomodoro timer written in python 3"
arch=('any')
license=('GPL V2')
depends=('alsa-utils'
         'dunst'
         'python3'
)

url="https://github.com/coodos/pymodoro/"
source=('pymodoro.py')
md5sums=('56e5be3fe6df013686297c4794649ff7')
prepare () {
    sudo pip install pyinstaller
    pyinstaller --onefile pymodoro.py
    cd ./dist/
    mv pymodoro ../
}

package() {
    install -D $srcdir/pymodoro $pkgdir/usr/bin/$pkgname
}
