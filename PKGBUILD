# Maintainer:   Maximilian Weiss   <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Martin Fiedler     <$(echo "a2V5akBlbXBoeS5kZQ==" | base64 -d)>
# Contributor:  Vladimir Ivanov    <$(echo "dmxhZGltaXJpdmFub3Y4MTVAZ21haWwuY29t" | base64 -d)>

pkgname=vcsteg
pkgver=3.0
pkgrel=1
pkgdesc='Real Steganography with TrueCrypt'
arch=('any')
url='https://keyj.emphy.de/real-steganography-with-truecrypt/'
# See python file for license
license=('custom:FOSS')

depends=('python')

provides=('vcsteg' 'tcsteg' 'vcsteg3' 'tcsteg3')
conflicts=('tcsteg' 'tcsteg2' 'tcsteg.py' 'tcsteg2.py' 'vcsteg' 'vcsteg2' 'vcsteg.py' 'vcsteg2.py'  'vcsteg3' 'vcsteg3.py' 'tcsteg3' 'tcsteg3.py')

source=('https://keyj.emphy.de/files/tcsteg3.py')
sha256sums=('d6b506865c8cb15d081c8fe77e4e18ec1f9e89cef1f9c400bf6a47a6447e0784')

package() {
    cd "$srcdir/"
    install -Dm755 "tcsteg3.py" "$pkgdir/usr/bin/tcsteg3.py"
    ln -s "tcsteg3.py" "$pkgdir/usr/bin/tcsteg3"
    ln -s "tcsteg3.py" "$pkgdir/usr/bin/tcsteg"
    ln -s "tcsteg3.py" "$pkgdir/usr/bin/vcsteg"
}

