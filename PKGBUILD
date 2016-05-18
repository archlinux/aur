_npmname=hackmyresume
_npmver=1.8.0
pkgname=nodejs-hackmyresume
pkgver=${_npmver}
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
sha256sums=(d152f56cd813da72a7f0caeab9f68ab36fd1863f5344ab5911568876464a6b71)

package() {
  cd ${srcdir}
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p ${_npmdir}
  cd ${_npmdir}
  npm install -g --prefix "${pkgdir}/usr" ${_npmname}@${_npmver}
}

# vim:set ts=2 sw=2 et:
