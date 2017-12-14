# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-snakemake-git'
pkgver=r2526.bb1a966
pkgrel=1
pkgdesc="Snakemake is a workflow management system that aims to reduce the complexity of creating workflows."
arch=('x86_64')
url="https://bitbucket.org/snakemake/snakemake"
license=('MIT')
depends=(
    'python-appdirs'
    'python-configargparse'
    'python-ratelimiter'
    'python-requests'
    'python-yaml'
    'python-wrapt')
makedepends=('python-setuptools')
provides=('python-snakemake')
conflicts=('python-snakemake')
options=(!emptydirs)
source=("git+https://bitbucket.org/snakemake/snakemake.git")
md5sums=('SKIP')

pkgver() {  # Number of revisions since beginning of history
  cd "${srcdir}/snakemake"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/snakemake"
  python setup.py install --root="$pkgdir/" --optimize=1
}
