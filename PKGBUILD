_gitname="camisole"
pkgname=camisole-git
pkgver=0.1.r0.g6bc31a4
pkgrel=1
pkgdesc="An asyncio-based source compiler and test runner."
arch=('any')
url="https://bitbucket.org/prologin/${_gitname}"
license=('GPL')
depends=('python' 'python-aiohttp')
makedepends=('git' 'python-setuptools')
optdepends=('esotope-bfc-git: compile Brainfuck sources'
            'fpc: compile Pascal sources'
            'fsharp: compile FSharp sources'
            'gambit-c: compile Scheme sources'
            'gcc: compile C, CXX sources'
            'gcc-ada: compile Ada sources'
            'ghc: compile Haskell sources'
            'java-environment-common: compile Java sources'
            'java-runtime-common: compile Java sources'
            'luajit: compile Lua sources'
            'mono: compile CSharp, FSharp, VisualBasic sources'
            'mono-basic: compile VisualBasic sources'
            'nodejs: compile Javascript sources'
            'ocaml: compile OCaml sources'
            'perl: compile Perl sources'
            'php: compile PHP sources')
source=("${_gitname}::git+${url}.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_gitname}"
    python setup.py install --root="${pkgdir}" || return 1
}
