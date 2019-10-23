# Maintainer: alienzj <alienchuj@gmail.com>

pkgname='python-snakemake-git'
pkgver=4.3.0.964.g86d6434c
pkgrel=1
pkgdesc="Python-based language and execution environment for GNU Make-like workflows"
arch=('any')
url="https://github.com/snakemake/snakemake"
license=('MIT')
depends=(
    'python'
    'python-wrapt'
    'python-requests'
    'python-ratelimiter'
    'python-configargparse'
    'python-yaml'
    'python-pyaml'
    'python-appdirs'
    'python-datrie'
    'python-jsonschema'
    'python-docutils'
    'python-gitpython'
    'python-psutil'
    'python-ftputil'
    'python-pysftp'
    'python-dropbox'
    'python-boto3'
    'python-moto'
    'python-httpretty'
    'python-pytools'
    'python-jinja'
    'python-networkx'
    'python-pygments'
    'python-pygraphviz'
    'python-pandas'
    #'python-gcsfs'
    'python-azure-storage'
    'libxrender'
    'libxpm'
    'imagemagick')
makedepends=('python-setuptools')
provides=('snakemake' 'snakemake-git' 'python-snakemake')
conflicts=('snakemake' 'snakemake-git' 'python-snakemake')
options=(!emptydirs)
source=("git+https://github.com/snakemake/snakemake.git")
md5sums=('SKIP')

pkgver() {  # Most recent un-annotated tag from last commit.
  cd $srcdir/snakemake
  git describe --long | sed 's/v\([^-]*-g\)/r\1/;s/-/./g' | sed 's/v\d*//g'
}

package() {
  cd $srcdir/snakemake
  python setup.py install --root="${pkgdir}/" --optimize=1
}
