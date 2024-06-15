_basename=vlauncher
pkgname=${_basename}-ve
pkgver=1.0.3
_pathname=${_basename}-${pkgver}
_tarname=${_pathname}-linux-amd64
pkgrel=1
pkgdesc="Launcher for Voxel Engine"
arch=(x86_64)
url="https://github.com/boolean-false/VLauncher-Releases"
depends=("jre17-openjdk")
source=("https://github.com/boolean-false/VLauncher-Releases/releases/download/$pkgver/$_tarname.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd $_pathname

    sed -i 's/Exec.*/Exec=\/usr\/bin\/vlauncher/g' ./share/applications/io.github.dagger.vlaucnher.desktop
}

package() {
    cd $_pathname
    mkdir $pkgdir/usr

    cp -rt $pkgdir/usr bin lib share
}

