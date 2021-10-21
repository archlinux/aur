# Maintainer: li <lcj211@aihlp.com>

pkgname=lcj
pkgver=1.0.0
pkgrel=18
pkgdesc="All tools for Lcj"
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
depends=('systemd-kexec' 'systemd-godns' 'git-tools' gfwlist-route  pkgfile)
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
optdepends=(
	'pkgbuild-introspection: For mksrcinfo'


)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=("ipmac"
"makesrcinfo"
"pullall"
pushall
fetchall

)
sha512sums=(
'8183dfdf382991ce1c686c7138290e0113d336436ffa5b60e0671eedbe43c90167b325dd237b1f6054d19695fc3f533beb2d3ac863f831379819a9de81933fbd'
75978d30a68de00cb50c23ba882dd73d9f365497025aacc271375249e7dd4aaff34732ced2ed1cbf2fc64fc3421b2fefc2ec64b16ef068e40d4343894b8c8bfb
7fa56ac8779f4c3695f2ef2d4c86a35cc33ccdfa60a2f97665bf542dbca6381c70b16b94d0a67661ba0915b94c9a38b8706a81fdb970ec89fe377f7f92cb2075
65c673c0ee9e351fe04decce6a0997360ded0b9804f6e9d8509fb7654ed9dc7bc71f18781c905403baf7a5fc44c24c6bfc17f46e79b3709747ba64850bd7c0b6
89931a1582d1a472e71f4869af98171f0ca33d9e82a0dae00d76243ffbed2e4f34be1d8dd656b1b4f16d91f0ee57b10b416ff392dae9f6288747808e1df9a4ea

)

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


}

groups=('lcj')

