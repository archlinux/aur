# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgname=soundscrape-git
pkgver=r237.efc63b9
pkgrel=1
pkgdesc='SoundCloud (and Bandcamp and Mixcloud) downloader in Python.'
arch=('any')
url='https://github.com/Miserlou/SoundScrape'
license=('Apache')

provides=('soundscrape')
depends=(
    'python'
    'python-args'
    'python-clint'
    'python-demjson'
    'python-fudge'
    'python-requests'
    'python-simplejson'
    'python-soundcloud'
    'python-wheel'
    'python-mutagen'
)
makedepends=('git' 'python-setuptools')
checkdepends=('python-nose')

source=('git+https://github.com/Miserlou/SoundScrape.git')
sha512sums=('SKIP')


build() {
    cd $srcdir/SoundScrape
    python setup.py build
}

package() {
    cd $srcdir/SoundScrape
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

check() {
    cd $srcdir/SoundScrape
    nosetests
}
