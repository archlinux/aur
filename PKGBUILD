# Maintainer: GordonGR <ntheo1979@gmail.com>

pkgname=singularityviewer-skins-git
_gitname=SingularityViewer
pkgver=1.8.6.710.g684ab3e
pkgrel=1
pkgdesc="Extra skins for Singularity (and any other V1-type viewers) for Second Life (secondlife) and OpenSim (opensimulator)."
url="http://github.com/singularity-viewer/SingularityViewer/tree/master/indra/newview/skins"
license=('GPL')
depends=('singularityviewer')
provides=('singularityviewer-skins')
conflicts=('singularityviewer-skins')
arch=('any')

source=('git://github.com/singularity-viewer/SingularityViewer.git')
md5sums=('SKIP')


pkgver() {
cd $_gitname
git describe --always | sed 's|-|.|g'
# echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
cd "$_gitname"
cd indra/newview/skins
rm -rf {default,dark}
rm -rf {dark,Default,paths}.xml

mkdir -p $pkgdir/opt/singularityviewer/skins
cp -R * $pkgdir/opt/singularityviewer/skins/

}
