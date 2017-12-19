# Maintainer:  Alexander Birukov <sanya.rnd@gmail.com>
# Contributor:  Alexander Birukov <sanya.rnd@gmail.com>

pkgname=pascalabcnet
pkgver=3.3.0.1599
pkgrel=1
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
    'd63890e3316a4c7cc50f373cc0277edb4f29381dd9c9a8c9b663c7f3d6e9e1d7'
    '62c1e5e946f96b7b0db876c736c6f7dda20a083b5f08b4ac710b95ed4805ff6f'
    '9066a40e4610924ee29dbae4a1e1045039c3a1afa602a62a494888e60189a5e1'
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

