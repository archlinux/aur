# AUR Maintainer: Modelmat <modelmat@outlook.com.au>
# Repository Owner: Mario Apra <mariotapra@gmail.com>
# Contributor: Modelmat <modelmat@outlook.com.au>

pkgname=onedriveclient-git
_pkgname=onedriveClient
pkgver=2018.10.1.e1a330c
pkgrel=1
pkgdesc="A Microsoft OneDrive and OneDrive for Business client for Linux, written in Python3."
url="https://github.com/derrix060/onedriveClient"
license=('MIT')
arch=('any')
provides=('onedrived')
depends=('inotify-tools'
        'python-arrow=0.12.1'
        'python-asn1crypto=0.24.0'
        'python-bidict=0.13.1'
        'python-certifi=2018.1.18'
        'python-cffi=1.11.5'
        'python-chardet=3.0.4'
        'python-click=6.7'
        'python-colorama=0.3.9'
        'python-cryptography=2.1.4'
        'python-daemonocle=1.0.1'
        'python-idna=2.6'
        'python-inotify-simple=1.1.7'
        'python-keyring=11.0.0'
        'python-psutil=5.4.3'
        'python-pycparser=2.18'
        'python-dateutils=2.7.0'
        'python-yaml=3.13'
        'python-secretstorage=2.3.1'
        'python-send2trash=1.5.0'
        'python-six=1.11.0'
        'python-tabulate=0.8.2'
        'python-urllib3=1.22'
        'python-zgitignore=0.8.0')
makedepends=('git')
source=('git+https://github.com/derrix060/onedriveClient'
        'onedriveClient.service')
sha256sums=('SKIP'
            '7bc185193041ed322fc179e7ec986575c14cfa218a2bdd4f8dc06983e7456024')

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  python setup.py clean
  install -Dm755 ../onedriveClient.service \
    "$pkgdir/usr/lib/systemd/user/onedriveClient.service"
}
