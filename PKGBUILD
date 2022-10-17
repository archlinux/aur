# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=twitch-chat-downloader
_name=tcd
pkgver=3.2.2
pkgrel=1
pkgdesc="Download chat messages from past broadcasts on Twitch "
arch=('any')
url="https://github.com/PetterKraabol/Twitch-Chat-Downloader"
license=('MIT')
depends=('python' 
         'python-requests' 'python-dateutil' 'python-pytz' 'twitch-python')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=('python-tcd')
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ee6a8e22c54ccfd29988554b13fe56b2a1bf524e110fa421d77e27baa8dcaa19')


build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
