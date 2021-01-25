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
source=('pymodoro.py' 
        'pymodoro'
)

sha256sums=('20e03acfafae79ee159115d2eb7503a808a8815c38a35a9ec8f94225e174efb2'
        'f5f0a9342159efc22fe201bf35ddbd7239eaefcf8c0406af137644106d7e1469'
)

prepare () {
    sudo pip install pyinstaller
    pyinstaller --onefile pymodoro.py
    cd ./dist/
    rm ../pymodoro
    mv pymodoro ../
}

package() {
    install -D $srcdir/pymodoro $pkgdir/usr/bin/$pkgname
}
