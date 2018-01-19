# Maintainer:  Alexander Birukov <sanya.rnd@gmail.com>
# Contributor:  Alexander Birukov <sanya.rnd@gmail.com>

pkgname=pascalabcnet
pkgver=3
pkgrel=3
pkgdesc="PascalABC.NET compiler"
arch=('any')
url="https://github.com/pascalabcnet/pascalabcnet"
license=('LGPL3')

depends=('mono>=4.5')
makedepends=('unzip')
# optdepends=('visual-studio-code: editor with PascalABC.NET integration (marketplace extension)')

# Text constants
_pkgfoldername='PascalABC.NET'
_archivename='PABCNETC.zip'
_pabc='pabcnetc'
_pabcclear='pabcnetcclear'

source=(
    http://pascalabc.net/downloads/$_archivename 
    $_pabc.sh 
    $_pabcclear.sh
)
sha256sums=(
    'SKIP'
    '5903380803609b5eaa0a5a1cfc5ddf86ffffc8a3fce312eb733adab660ce035c'
    '42fd2a14dffc555046f187a501ba1fffcff11d95cc39f68484fe32204fe73b75'
)

package() {
    # create folders
    install -d "${pkgdir}/opt/${_pkgfoldername}"
    install -d "${pkgdir}/usr/bin"
    
    # extract files
    unzip ${_archivename} -d ${pkgdir}/opt/${_pkgfoldername}
    
    # create symlink
    install -Dm755 $_pabc.sh "$pkgdir/usr/bin/$_pabc"
    install -Dm755 $_pabcclear.sh "$pkgdir/usr/bin/$_pabcclear"
}

