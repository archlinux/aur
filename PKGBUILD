# Maintainer: Scott Gigante <scottgigante@gmail.com>

_name=googledrivedownloader
pkgname=python-$_name
pkgver=0.4
pkgrel=1
pkgdesc='Minimal class to download shared files from Google Drive.'
arch=(any)
url="https://github.com/ndrplz/google-drive-downloader"
license=(MIT)
depends=(python python-setuptools)
_wheel="${_name}-${pkgver}-py2.py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/3a/5c/485e8724383b482cc6c739f3359991b8a93fb9316637af0ac954729545c9/$_wheel")
sha256sums=('26ef906c4a038de6fb36f375b0cb0af6f0b6d7ea9ce019a3a08abc50fd6a3b73')
noextract=("$_wheel")

package() {
    local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
    mkdir -p "$site"
    unzip "$_wheel" -d "$site"
}
