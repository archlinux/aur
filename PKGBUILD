_npmname=hackmyresume
_npmver=1.9.0-beta
pkgname=nodejs-hackmyresume
pkgver=${_npmver/-/_}
pkgrel=1
pkgdesc="Generate polished résumés and CVs in HTML, Markdown, LaTeX, MS Word, PDF, plain text, JSON, XML, YAML, smoke signal, and carrier pigeon."
arch=(any)
url="https://github.com/hacksalot/HackMyResume"
license=()
depends=('nodejs' 'npm')
optdepends=("phantomjs: PDF support"
            "wkhtmltopdf: PDF support")
source=("http://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=(${_npmname}-${_npmver}.tgz)
sha256sums=('c9c23dd946712642309275ad12d15bb1753e0e4235e27c5542181dd3ddfe0ba6')

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
