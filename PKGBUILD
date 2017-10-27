pkgdesc="Takari Extensions for Apache Maven"
pkgname="maven-team"
pkgver=1
pkgrel=4
url="http://takari.io/book/30-team-maven.html"
arch=('any')
license=('Apache')
depends=('maven')
provides=('maven-team')
conflicts=('maven-team-git')
#
mavenCentralURL=http://repo1.maven.org/maven2
#
versionFileManager="0.8.3"
versionSmartBuilder="0.6.1"
versionLocalRepository="0.11.2"
#
artifactFileManager="takari-filemanager"
artifactSmartBuilder="takari-smart-builder"
artifactLocalRepository="takari-local-repository"
#
packageFileManager="$artifactFileManager-$versionFileManager.jar"
packageSmartBuilder="$artifactSmartBuilder-$versionSmartBuilder.jar"
packageLocalRepository="$artifactLocalRepository-$versionLocalRepository.jar"
#
source=(
    "$mavenCentralURL/io/takari/takari-filemanager/$versionFileManager/$packageFileManager"
    "$mavenCentralURL/io/takari/maven/takari-smart-builder/$versionSmartBuilder/$packageSmartBuilder"
    "$mavenCentralURL/io/takari/aether/takari-local-repository/$versionLocalRepository/$packageLocalRepository"
)
noextract=(
    "$packageFileManager"
    "$packageSmartBuilder"
    "$packageLocalRepository"
)
backup=(
)
md5sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)
options=('!strip')

# 1.
prepare() {
    true
}

# 2.
build() {
    true
}

# 3.
check() {
    true
}

# 4.
package() {
	# see https://www.archlinux.org/packages/community/any/maven/
    local home="/opt/maven"
    
    # see http://takari.io/book/30-team-maven.html#installation-and-usage
    local source="$srcdir"
    local target="$pkgdir/$home/lib/ext"
    
    mkdir -p "$target"
    cp -a -L "$source/." "$target/"
}
