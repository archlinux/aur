# Maintainer: Rick Kerkhof <rick.2889@gmail.com>
pkgname=soundnode-app-bin
pkgver=0.6.1
pkgrel=2
pkgdesc="Soundcloud client for the desktop"
arch=('x86_64' 'i686')
url="http://www.soundnodeapp.com/"
license=('GPL3')

# Required, otherwise it won't run.
options=('!strip')

makedepends=()
depends=()
optdepends=()

# I couldn't figure out how to build it properly and the website has no per-release
# archives. The SHA256sums will fail if it updates; that should be an indication that
# this package has become out of date.
source_x86_64=("http://www.soundnodeapp.com/downloads/linux64/Soundnode-App.zip")
source_i686=("http://www.soundnodeapp.com/downloads/linux32/Soundnode-App.zip")

# Generic sources.
source=("https://raw.githubusercontent.com/Soundnode/soundnode-app/0.6.1/app/soundnode.png"
"soundnode-app.desktop")

sha256sums_x86_64=('9cdec26938b3463568f14566f698c619d72c2dff66fc858079df1a89c970527d')
sha256sums_i686=('807f2d058b5f511129dfd35d22ed874d1cc6fef81a14979e9aef4922bddb4a17')

# Generic checksums.
sha256sums=('aaae33882ab1e2334b4a33b4235cbdd4beb1379b08f5fa3a0a270f716ea43fa7'
'ce386ef34305923a3d10567be4e90963f0186852f8d5fe99f324dbfc487a2e6f')

package() {
        install -d -m 755 ${pkgdir}/opt/
        install -d -m 755 ${pkgdir}/usr/share/applications/
        
        
        install -D -m 644 ${srcdir}/soundnode-app.desktop ${pkgdir}/usr/share/applications/
    
        rm ${srcdir}/Soundnode-App.zip
        rm ${srcdir}/soundnode-app.desktop
	cp -Lr ${srcdir} $pkgdir/opt/${pkgname}
}
