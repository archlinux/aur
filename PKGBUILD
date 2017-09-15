_npmname=resume-cli
_npmver=0.4.19
pkgname=nodejs-resume-cli
pkgver=${_npmver}
pkgrel=1
pkgdesc="This is the command line tool for JSON Resume, the open source initiative to create a JSON-based standard for resumes."
arch=(any)
url="https://github.com/jsonresume/resume-cli"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=(${_npmname}-${_npmver}.tgz)
sha256sums=(5394cb51e00128c3cb0329125ae429edab3d2367c7f3b6e00919134730467623)

package() {
    cd ${srcdir}
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p ${_npmdir}
    cd ${_npmdir}
    npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
