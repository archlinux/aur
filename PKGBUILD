# Maintainer: Shawn McCool <shawn@mccool.email>
pkgname=dredge-looper-bin
_appname=dredge
pkgver=0.6.0
pkgrel=1
pkgdesc="Ear-first practice looper: loop sections, slow them down pitch-preserving, drill passages (prebuilt)"
arch=('x86_64')
url="https://github.com/ShawnMcCool/dredge"
license=('MIT')
depends=('rubberband' 'pipewire' 'webkit2gtk-4.1' 'gtk3')
optdepends=('ffmpeg: MP3 export, extra container formats, and demucs stem export'
            'uv: bootstrap the analyze/songformer ML venvs (beats, sections)'
            'python: ML analysis runtime'
            'demucs: 4-stem separation (vocals/drums/bass/other)')
provides=('dredge')
conflicts=('dredge')
source=("https://github.com/ShawnMcCool/dredge/releases/download/v${pkgver}/${_appname}-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('fc13c5554242a45f12eb27083eb5580da557e99bbcdb436eb2efb33768ac4193')

package() {
  # The tarball is a relocatable /usr tree (see `just tarball`).
  cp -a "${srcdir}/${_appname}-${pkgver}-x86_64-linux/usr" "${pkgdir}/"
}
