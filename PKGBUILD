# Maintainer: Mees Valkenburg <`echo Zmx1ZmZ5QGdvZG90LnVrLnRvCg== | base64 -d`>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte*gmail>
# Contributor: Daniel Dulaney <dan@dulaney.xyz>

pkgname='dtrx-git'
pkgver=7.1.671ccf7
pkgrel=1
pkgdesc='An intelligent archive extraction tool'
arch=('any')
url='http://github.com/brettcs/dtrx'
license=('GPL3')
depends=('python2')
optdepends=(
  'tar: to extract tar, deb, and gem archives'
  'unzip: to extract zip archives'
  'cpio: to extract cpio and rpm archives'
  'rpm-org: to extract rpm archives'
  'binutils: to extract deb archives'
  'gzip: deb, gem, gzip, and compress archives'
  'bzip2: to extract deb and bzip2 archives'
  'xz: to extract xz archives'
  'p7zip: to extract 7z archives'
  'unrar: to extract rar archives'
  'cabextract: to extract MS Cabinet archives'
  'unshield: to extract InstallShield archives'
  'lha: to extract lzh archives'
)
provides=(dtrx)
conflicts=(dtrx)

md5sums=('SKIP')
source=('git+https://github.com/brettcs/dtrx.git')

pkgver() {
    cd dtrx
    cat <(python2 setup.py --version | tr "\n" .) \
        <(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/dtrx"
  python2 setup.py install --root="$pkgdir"
}

