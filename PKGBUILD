# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-django-recaptcha"
_name="django-recaptcha"
pkgver=4.1.0
pkgrel=1
pkgdesc="Django reCAPTCHA form field/widget integration app"
arch=("any")
url="https://github.com/django-recaptcha/django-recaptcha"
license=("BSD-3-Clause")
depends=("python" "python-django")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('73097b958733f65b729d4e4630c51fc2bf147aca6f026017d18898dfc25cb4c5')

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
