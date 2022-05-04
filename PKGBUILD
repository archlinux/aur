# Maintainer: KUMAX <kumax2048@pm.me>

_name=ddns
pkgname=python-ddns
pkgrel=1
pkgver=2.10.3
pkgdesc="Automatically update DNS records to dynamic local IP."
url=https://pypi.org/project/ddns
arch=('any')
makedepends=('python-pip' 'python-installer')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py2.py3-none-any.whl")
sha256sums=('ef84efaf305d656400eca8a924754d9d31b28378f96b2704b1f3c162de609d5a')
makedepends=(python-build python-installer python-wheel)
install=$pkgname.install

package() {
	python -m installer --destdir="$pkgdir" *.whl
        install -Dm644 newfuture_ddns.service  "${pkgdir}/usr/lib/systemd/system/newfuture_ddns.service"
        install -Dm644 newfuture_ddns.timer "${pkgdir}/usr/lib/systemd/system/newfuture_ddns.timer";
        install -Dm644 config.json "${pkgdir}/etc/ddns/config.json";
}
