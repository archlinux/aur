# Maintainer: Deepjyoti <deep.barman30@gmail.com>
pkgname=downloader-cli
pkgver=0.3.4
pkgrel=0
pkgdesc="A simple downloader with an awesome progressbar"
arch=("any")
url="https://github.com/deepjyoti30/downloader-cli"
license=('MIT')
depends=(
    "python>=3.6"
    "python-urllib3"
)
makedepends=("git" "python-setuptools")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/a0/45/6b0095df8875e6ce2b83f365a9cf06c78e438d3f0997927894524aa530e0/downloader_cli-0.3.4.tar.gz")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
    cd "downloader_cli-${pkgver}"
    python setup.py build
}

package() {
    cd "downloader_cli-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
