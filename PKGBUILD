# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
_pkgname=AnnexRemote
pkgver=1.6.6
pkgrel=2
pkgdesc='git annex special remotes made easy'
url="https://github.com/Lykos153/$_pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=(python)
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools-scm)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('890b358429061b265d82bd21f3e2f86825ba9911496e7c23f97979b979adf7fa')

build() {
	cd "$_pkgname"
	python -m build -wn
}

package() {
	cd "$_pkgname"
	python -m installer -d "$pkgdir" dist/*.whl
}
