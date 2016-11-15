pkgdesc="Takari Extensions for Apache Maven"
pkgname="maven-team"
pkgver=1
pkgrel=1
url="http://takari.io/book/30-team-maven.html"
arch=('any')
license=('Apache')
depends=('maven')
provides=('maven-team')
conflicts=('maven-team-git')
#
mavenCentralURL=http://repo1.maven.org/maven2
#
versionFileManager=0.8.3
versionSmartBuilder=0.4.1
versionLocalRepository=0.11.2
#
artifactFileManager="takari-filemanager-$versionFileManager.jar"
artifactSmartBuilder="takari-smart-builder-$versionSmartBuilder.jar"
artifactLocalRepository="takari-local-repository-$versionLocalRepository.jar"
#
source=(
    "$mavenCentralURL/io/takari/takari-filemanager/$versionFileManager/$artifactFileManager"
    "$mavenCentralURL/io/takari/maven/takari-smart-builder/$versionSmartBuilder/$artifactSmartBuilder"
    "$mavenCentralURL/io/takari/aether/takari-local-repository/$versionLocalRepository/$artifactLocalRepository"
)
noextract=(
    "$artifactFileManager"
    "$artifactSmartBuilder"
    "$artifactLocalRepository"
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
    local home="/opt/maven"
    local source="$srcdir"
    local target="$pkgdir/$home/lib/ext"
    
    mkdir -p "$target"
    cp -a "$source/." "$target/"
    
}
