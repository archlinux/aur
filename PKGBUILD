_npmname=resume-cli
_npmver=1.1.2
pkgname=nodejs-resume-cli
pkgver=${_npmver}
pkgrel=1
pkgdesc="The command line tool for JSON Resume"
arch=(any)
url="https://github.com/jsonresume/resume-cli"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=(${_npmname}-${_npmver}.tgz)
sha256sums=('88e4dda20f63ef3e84ec14f85c5760c371ac281ea09d9e64afdcdf4d76f21728')

package() {
    cd ${srcdir}
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p ${_npmdir}
    cd ${_npmdir}
    npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
