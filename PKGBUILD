# Maintainer: li <lcj211@aihlp.com>

pkgname=lcj
pkgver=1.0.0
pkgrel=29
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
savegitignore
saveaur
mkmvngitignore
)
sha512sums=('8183dfdf382991ce1c686c7138290e0113d336436ffa5b60e0671eedbe43c90167b325dd237b1f6054d19695fc3f533beb2d3ac863f831379819a9de81933fbd'
            '75978d30a68de00cb50c23ba882dd73d9f365497025aacc271375249e7dd4aaff34732ced2ed1cbf2fc64fc3421b2fefc2ec64b16ef068e40d4343894b8c8bfb'
            '7fa56ac8779f4c3695f2ef2d4c86a35cc33ccdfa60a2f97665bf542dbca6381c70b16b94d0a67661ba0915b94c9a38b8706a81fdb970ec89fe377f7f92cb2075'
            '65c673c0ee9e351fe04decce6a0997360ded0b9804f6e9d8509fb7654ed9dc7bc71f18781c905403baf7a5fc44c24c6bfc17f46e79b3709747ba64850bd7c0b6'
            '89931a1582d1a472e71f4869af98171f0ca33d9e82a0dae00d76243ffbed2e4f34be1d8dd656b1b4f16d91f0ee57b10b416ff392dae9f6288747808e1df9a4ea'
            'a0603b1a51571f5308e228ae02fdfa30bfa0c8d989f137aeee223b585ff8a6ffd5cc738de92494a8a9b13e62f6e8f28da112aed229d4a5ab8e2a79cfb812fbbc'
            'b0cddef03746a5b8c2ca6be899a7e63fc25e2bbbd743f4a3566a4b4e1dd71419b3010f0dd16b80b5d943fab2b37ef1dae8819006ed916cba3a51960deb2a7696'
            '29fc3a014cf6fd4babf1c21ffcffd2a7c891a5dc4e6399788f9994a2a26496bd40b78579df314aaedc4918e78c2e1bb097a93fd358afa69e6f322b080525353a'
            '5b0340e455bdd1dcb960e6d5d57e2194c6a60e21da70bf9ed37bd22662866eb918ac5a8801ab5020b596261301d267800dfd3387abab2f69bb650c0f49362592'
            '966811ad453d6db13a51c294504e8ed0c6a0ffe2cdff756cfa88fb22b2998de8228cd2265c2eaab8ae01116531412831d06b1b9bf54af4b8b09bb065e3771816'
            b1d3136d75260e135edb806c8ccfc48b61a539a518b79ad45937789283d2dc637d1c169264f2adf3d687454b4bb314a0ce24b3fd4e738bc4c865ccbd98245a8f
	    '97ac6b71f77219f74d6f02cac7c5eb4e4e0a68074d0d972107d35127daf4f4804e7e6cd07591ae15b8a50b520e24970fa7945e440b324cfd4dd1301f8d71dc81')


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
install  -Dm755 savegitignore  "$pkgdir/usr/bin/savegitignore"
install  -Dm755 saveaur  "$pkgdir/usr/bin/saveaur"
install  -Dm755 mkmvngitignore  "$pkgdir/usr/bin/mkmvngitignore"

}

groups=('lcj')

