_npmname=resume-cli
_npmver=1.2.7
pkgname=nodejs-resume-cli
pkgver="${_npmver}"
pkgrel=1
pkgdesc="The command line tool for JSON Resume"
arch=(any)
url="https://github.com/jsonresume/resume-cli"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=(${_npmname}-${_npmver}.tgz)
sha256sums=('a84f2739ca1d2ee5d9ca113ae9a9a7ee9d90808f9bffbade8e72c12eb2552958')

package() {
    cd ${srcdir}
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p ${_npmdir}
    cd ${_npmdir}
    npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
