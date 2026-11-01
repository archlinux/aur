# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-django-recaptcha"
pkgver=4.1.0
pkgrel=1
pkgdesc="Django reCAPTCHA form field/widget integration app"
arch=("any")
url="https://github.com/django-recaptcha/django-recaptcha"
license=("BSD-3-Clause")
depends=("python" "python-django")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2ae33572c0abaf79ccf7e1ba2928ee6597318f761ead52f37511b7f5f012d0fb')

build(){
 cd "django-recaptcha-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "django-recaptcha-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
