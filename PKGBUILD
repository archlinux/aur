# Maintainer: Joffrey <j-off@live.fr>

pkgname=('python2-django-constance' 'python-django-constance')
pkgbase='python-django-constance'
pkgver=2.2.0
pkgrel=1
pkgdesc='Dynamic Django settings'
arch=('any')
url='https://github.com/jazzband/django-constance'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/jazzband/django-constance/archive/$pkgver.tar.gz")
sha256sums=('4e2bb9a19cbc91eccda13464e2f9db810eadb42672bb4eb1c2160e1fe5ede45f')

package_python-django-constance() {
    depends=('python-django')
	optdepends=(
		'python-django-picklefield: Database support'
		'python-redis: Redis support'
	)
	cd "$srcdir/django-constance-$pkgver"
	install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python './setup.py' install --root="$pkgdir" --optimize=1
}

package_python2-django-constance() {
	depends=('python2-django')
	optdepends=(
		'python2-django-picklefield: Database support'
		'python2-redis: Redis support'
	)
    cd "$srcdir/django-constance-$pkgver"
	install -Dm644 './LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python2 './setup.py' install --root="$pkgdir" --optimize=1
}
