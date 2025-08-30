# Maintainer: Sadie <zulc22db+oss@gmail.com>
pkgname=gamemaker-steamruntime-sdk-bin
pkgver=latest
pkgrel=2
epoch=
pkgdesc="Steam Runtime SDK install from GameMaker setup instructions"
arch=('x86_64')
url="https://help.gamemaker.io/hc/en-us/articles/235186168-Setting-Up-For-Ubuntu"
license=('custom:unknown')
source=("https://repo.steampowered.com/steamrt-images-scout/snapshots/latest-steam-client-general-availability/com.valvesoftware.SteamRuntime.Sdk-amd64,i386-scout-sysroot.tar.gz")
noextract=('com.valvesoftware.SteamRuntime.Sdk-amd64,i386-scout-sysroot.tar.gz')
sha256sums=('SKIP')
options=(!strip !debug)

package() {
    mkdir -p "$pkgdir/opt/steam-runtime"
    echo "Extracting targz"
    tar -xzf 'com.valvesoftware.SteamRuntime.Sdk-amd64,i386-scout-sysroot.tar.gz' -C "$pkgdir/opt/steam-runtime/"
    cd "$pkgdir/opt/steam-runtime/"
    cp bin/{sh,dash,cat,ls} usr/bin/ # (sourced from https://www.reddit.com/r/gamemaker/comments/112iuep/linux_fixing_compile_errors_on_non_ubuntu_distros/)
}
