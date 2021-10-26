# Maintainer: li <lcj211@aihlp.com>

pkgname=lcj
pkgver=1.0.0
pkgrel=33
pkgdesc="All tools for Lcj"
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
depends=('systemd-kexec' 'systemd-godns' 'git-tools' gfwlist-route  pkgfile systemd-autossh
systemd-wol
archlinuxcn-keyring
archlinuxcn-mirrorlist
devtools
wireguard-tools-china


)
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
optdepends=(
	'pkgbuild-introspection: For mksrcinfo'


)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=(
ipmac
makesrcinfo
pullall
pushall
fetchall
pppoecheck
pppoecheck.service
pppoecheck.timer
check-file-exists
compare-file-by-sha512
savegitignore
saveaur
mkmvngitignore
mkuefi
mkbiosvda
)

sha256sums=('86dbba2f81e69ba95710b4ce976ff5cb4b95150d4ab9507a8141facd082f54f4'
            'cecf5ea524bf42427f8c196ed0f938db4393e78701d5ef1560841cc26ce3e215'
            'ff424190846bb2d5958e472bb67bb16c7b3154c503e81812a0274801e04b9302'
            '1c2960a1b2a433fb78a116c11478882b1e4d593dc47af5ea694373d8cd6aa12d'
            'cca1c4d89a1d041856c783cf24bc12ded0f7d79d74905e8b31ad4290f9670c84'
            'c9f31a381284cc042cfd581af06485077b3830d08bce0e1884588d060077985e'
            'bbe7c26fc4955e9422cc6abfe8bf024dde459f6922be344d80152ea75d77a1fc'
            'eac4ce4e9e21818435244b566e6a888d6c67a77a44fa097bcd489df2a999d483'
            '352f374b9bf8d473c3a8b255ea45c52aee8aa3eda2daab718bf7163574f7747b'
            '90bfadfacb18c1262cfd592b252472e3947b315c2eadc91492f1acda6aaf850a'
            '20f1b05119da70fbbe245576575f5310cb9165cb1ffb0cf9320bbe566370ca24'
            'd8da59c21a01f943d2dbc3d33c5c656e6857ff1eeb22666b43b2eb845a8f8cc9'
            '995f49fdd5c7a7358428840330183510173e8ce3de59e17ef058ed7a3b21aaea'
            'b2095a4ebc3ac0bafcb4ece454e1122a4974bdb2c2a9359a1cae30aba477b3a0'
            '8a316438ae959ea1fed6d61759549b1586e5b64509e9d43e5012735334dad2db')


#Package files should follow these general directory guidelines:
#/etc	System-essential configuration files
#/usr/bin	Binaries
#/usr/lib	Libraries
#/usr/include	Header files
#/usr/lib/{pkg}	Modules, plugins, etc.
#/usr/share/doc/{pkg}	Application documentation
#/usr/share/info	GNU Info system files
#/usr/share/man	Manpages
#/usr/share/{pkg}	Application data
#/var/lib/{pkg}	Persistent application storage
#/etc/{pkg}	Configuration files for {pkg}
#/opt/{pkg}	Large self-contained packages


#build() {
 # rm -rf build
 # cmake -B build -S "$pkgname-v$pkgver" \
 # -DCMAKE_INSTALL_PREFIX=/usr \
 # -DBUILD_TESTING=OFF \
 # -Wno-dev
 # make -C build:

#}

package() {
# make -C build DESTDIR="$pkgdir" install
install  -dm755   "$pkgdir/etc/systemd/system"
install  -Dm755 ipmac  "$pkgdir/usr/bin/ipmac"
install  -Dm755 pushall  "$pkgdir/usr/bin/pushall"
install  -Dm755 pullall  "$pkgdir/usr/bin/pullall"
install  -Dm755 fetchall  "$pkgdir/usr/bin/fetchall"
install  -Dm755 makesrcinfo  "$pkgdir/usr/bin/makesrcinfo"
install  -Dm644  pppoecheck.service  "$pkgdir/usr/lib/systemd/system/pppoecheck.service"
install  -Dm644  pppoecheck.timer  "$pkgdir/usr/lib/systemd/system/pppoecheck.timer"
install  -Dm755  pppoecheck  "$pkgdir/usr/lib/$pkgname/pppoecheck"
install  -Dm755 check-file-exists  "$pkgdir/usr/bin/check-file-exists"
install  -Dm755 compare-file-by-sha512  "$pkgdir/usr/bin/compare-file-by-sha512"
install  -Dm755 savegitignore  "$pkgdir/usr/bin/savegitignore"
install  -Dm755 saveaur  "$pkgdir/usr/bin/saveaur"
install  -Dm755 mkmvngitignore  "$pkgdir/usr/bin/mkmvngitignore"
install  -Dm755 mkuefi  "$pkgdir/usr/bin/mkuefi"
install  -Dm755 mkbiosvda  "$pkgdir/usr/bin/mkbiosvda"

}

groups=('lcj')

