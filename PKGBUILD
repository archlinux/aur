# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>

pkgname=futhark-bin
provides=('futhark')
conflicts=('futhark')
pkgver=0.22.7
pkgrel=1
pkgdesc="A data-parallel functional programming language."
arch=('x86_64')
url='https://futhark-lang.org/'
license=('custom:ISC')
depends=('ncurses5-compat-libs' 'zlib')
optdepends=('opencl-headers: OpenCL backend'
            'cuda: CUDA backend'
            'python-pyopencl: PyOpenCL backend')
source=("https://github.com/diku-dk/futhark/releases/download/v${pkgver}/futhark-${pkgver}-linux-x86_64.tar.xz"
		"https://raw.githubusercontent.com/diku-dk/futhark/v${pkgver}/LICENSE")

sha1sums=('cdbc72b938bf08eaecf632ce7216df7372658a6b'
            'abc5591d4e49c94371c8397998371bafb50a5bc1')
sha256sums=('bcc78af0283bd5e089382012411999e7e80062588a9ea833315cbfac3806e7fc'
            'd029ffa271dcee84cc883fb9e83744f703401e2abb097b8ef084fff0674d935b')
b3sums=('844430cfde872c0b10a0cda3bd686ded5701d8425467a7f38dc9291f1824c69dddb0f8d27c78d2f7dfa45551c0a7220a0c830d470ed75450739e41e25c565f16', 
            '6c7bb637165ea3ac6b417f0217754487850f2887146751e6daa45e4a023c8345f65dd505d1bb64d58070ccd74e245b46d5730fbbaf1c0bf463f7331799846e66')
package() {
    cd "${srcdir}/futhark-${pkgver}-linux-x86_64"
    make PREFIX="${pkgdir}/usr" install
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
