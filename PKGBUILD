# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python-webdavclient
_name=${pkgname#python-}
pkgver=1.0.8
pkgrel=1
pkgdesc="WebDAV API, resource API and wdc for WebDAV servers"
arch=("any")
url="https://github.com/CloudPolis/webdav-client-python"
license=("MIT")
depends=("python" "python-pycurl" "python-lxml" "python-argcomplete")
makedepends=("python-pip" "curl")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("c4df5953822f87b48504fc0f4ecdb08ae6a518e67e96f9e8e27d841c0cd29d7a")

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.tar.gz || exit
    curl "https://raw.githubusercontent.com/CloudPolis/webdav-client-python/master/LICENSE.md" -o LICENSE.txt || exit
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
