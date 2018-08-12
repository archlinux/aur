pkgbase='rawsteel-music-player'
pkgname='rawsteel-music-player'
pkgver=1.0.6
pkgrel=1
pkgdesc='A minimal music player with lyric show'
url='https://github.com/baijifeilong/rawsteelp'
depends=('python' 'python-pyqt5' 'python-pytaglib' 'python-chardet')
makedepends=('python-setuptools')
arch=('any')
license=('GPL3')
source=('https://files.pythonhosted.org/packages/21/54/20b6930bdf0adc26e4493e33fbcb8e4bcb890e12bc06121b076e40ebb11a/rawsteel-music-player-1.0.6.tar.gz' 'https://raw.githubusercontent.com/baijifeilong/resources/master/rawsteel-music-player/rawsteel-music-player.desktop')
md5sums=('40cc409177441ed6d025cc1b21fd9fed' 'a362df8d7c5a4b5a7e3268b365fabd55')

package() {
    echo Current directory: $(pwd)
    ls
    echo
    cd "${srcdir}/${pkgname}-${pkgver}"
    echo Current directory: $(pwd)
    ls
    echo
    echo Installing ...
    echo
    python setup.py install --root="${pkgdir}" --optimize=1
    echo
    echo Adding application desktop entry ...
    install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
