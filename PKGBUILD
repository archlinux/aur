# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit || com>

pkgname=palm-sdk-oldimages
pkgver=3.0.2
pkgrel=1
pkgdesc="Emulator images no longer included in palm-sdk"
url="http://developer.palm.com/index.php"
arch=(any)
license=("custom:palm-sdk")
depends=("palm-sdk")
_dlpath="https://cdn.downloads.palm.com/sdkdownloads/emulator-images/"

# remove those you don't want ( each ~150MiB ) remove them from all arrays
source=("${_dlpath}SDK%201.3.5.368.vmdk.zip"
        "${_dlpath}SDK%201.4.0.420.vmdk.zip"
        "${_dlpath}SDK%201.4.1.427.vmdk.zip"
        "${_dlpath}SDK%201.4.5.465.vmdk.zip"
        "${_dlpath}SDK%202.1.0.519.vmdk.zip"
        "${_dlpath}SDK-2210.vmdk.zip")


sha1sums=("77985e7f63a7f7455e5fa2037e70e517ab352a15"
        "5a844dd6377e03ac602731bf230fda651c84a74f"
        "deb2813927f19f73ed1f89ea5f032f6a89e0ad13"
        "d4b884e6f155cc2a5baf6e1bfe77f4e4c9faa32f"
        "2db241a11dabc892c5aaf9ed7dce06ab444a2fa7")
        
# this is lame, any ideas?

# !Important!
# this won't work with present makepkg, as spaces are breaking noextract
# --> on line 677 in /usr/bin/makepkg  add "" around ${noextract[@]}
# this is going to be fixed in [pacman]-4.0
noextract=('SDK%201.3.5.368.vmdk.zip'
        'SDK%201.4.0.420.vmdk.zip'
        'SDK%201.4.1.427.vmdk.zip'
        'SDK%201.4.5.465.vmdk.zip'
        'SDK%202.1.0.519.vmdk.zip'
        "SDK-2210.vmdk.zip")



package(){

        mkdir -p                ${pkgdir}/opt/PalmSDK/Current/share/emulator/images/
        cp ${srcdir}/*.vmdk.zip ${pkgdir}/opt/PalmSDK/Current/share/emulator/images/

}
