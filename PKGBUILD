# Maintainer: Daniele Paolella <danpaolella@gmail.com>
# Contributor: mmh <aur@with-h.at>

pkgname="git-store-meta"
pkgver=2.3.7
pkgrel=1
pkgdesc="Simple file metadata storing and applying for git"
arch=(any)
url="https://github.com/danny0838/${pkgname}"
license=('MIT')
depends=('coreutils' 'git>=1.7.2' 'perl>=5.8')
optdepends=('acl: Manipulate ACL metadata')
changelog=$pkgname.changelog
source=("https://github.com/danny0838/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('86ab4b587e0dbe7b6458bdebd6b97bf1aac9010d3c029be93934118736811bfe')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i 's|git-store-meta\.pl|git-store-meta|g' git-store-meta.pl
}

package() {
    cd "${pkgname}-${pkgver}"
    install -D git-store-meta.pl "${pkgdir}/usr/bin/git-store-meta"
}
