# Maintainer: thegala <thegala@disroot.org>
# Contributor: Mees Valkenburg <`echo bWVlc3J1ZGlnZXJhcmRAbGl2ZS5ubAo= | base64 -d`>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: rabyte <rabyte*gmail>

_pkgname='dtrx'
pkgname='dtrx-python3-git'
pkgver=9.0.830399c
pkgrel=1
pkgdesc='An intelligent archive extraction tool'
arch=('any')
url='http://github.com/verhovsky/dtrx'
license=('GPL3')
depends=('python')
makedepends=('git' 'python-setuptools')
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

md5sums=('SKIP')
source=("git+https://github.com/verhovsky/${_pkgname}")
provides=('dtrx')
conflicts=('dtrx')


pkgver() {
    cd "${srcdir}/${_pkgname}"
    cat <(python setup.py --version | tr "\n" .) \
        <(git rev-parse --short HEAD)
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1
}
