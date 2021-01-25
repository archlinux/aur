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

md5sums=('SKIP'
        'SKIP'
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
