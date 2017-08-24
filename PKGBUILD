# Do not edit PKGBUILD directly. Edit PKGBUILD.tpl and update the setup.json file

# Maintainer: madflow <madflow@web.de>
pkgname=shrr
pkgver=0.1.3_dev
pkgrel=1
pkgdesc="Share files via HTTP"
arch=('any')
url="https://gitlab.com/madflow/shrr"
license=(MIT)
groups=()
depends=('python>=3.3' 'python-flask' 'python-netifaces' 'python-colorama' 'python-qrcode')
makedepends=('python-setuptools' 'python-pip' 'nodejs' 'yarn')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://gitlab.com/madflow/shrr/repository/778ca99a109ccf69cc4c78786ae5eec501d83afe/archive.tar.gz)
noextract=()
md5sums=(aaa79beceeb65385b49480a2d12ee285)

package() {
  cd "$srcdir/$pkgname-778ca99a109ccf69cc4c78786ae5eec501d83afe-778ca99a109ccf69cc4c78786ae5eec501d83afe"
  python setup.py yarn run build:prod
  python setup.py install --root="$pkgdir/" --optimize=1
}
